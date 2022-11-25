import { format, parse, parseISO } from 'date-fns';
import Router from 'next/router';
import { useEffect } from 'react';
import useSWR from 'swr';
import Display from '../../components/Display';
import Header from '../../components/Header';
import { Message } from '../../components/Message';
import { useUser } from '../../lib/UserContext';
import style from '../../styles/Cart.module.css';
import fetcher from '../../utils/fetcher';
const Cart = () => {
	const { user, setUser } = useUser();
	useEffect(() => {
		if (localStorage.getItem('user')) {
			setUser(JSON.parse(localStorage.getItem('user')));
		} else {
			Router.push('/');
			console.log('sss');
		}
	}, [setUser]);

	const { data, error } = useSWR(
		`/api/user/bills?UserId=${user?.userId}`,
		fetcher,
		{ refreshInterval: 1000 }
	);
	if (error) return <div>failed to load</div>;
	if (!data) return <div>loading...</div>;
	if (data.data.length === 0)
		return (
			<>
				<Header />
				<main className={style.main}>
					<div>还没有订单哟</div>
				</main>
			</>
		);
	const bills = data.data.map((item) => {
		item.transactionTime = format(
			parseISO(item.transactionTime),
			'yyyy-MM-dd hh:mm:ss'
		);
		return item;
	});
	const headers = [
		'billId',
		'commodityNames',
		'totalPrice',
		'address',
		'nums',
		'transactionTime',
	];
	const handleCancel = (bill) => {
		if (
			new Date() -
				new Date(
					parse(
						bill.transactionTime,
						'yyyy-MM-dd hh:mm:ss',
						new Date()
					).getTime()
				) >
			1000 * 60 * 60 * 24
		) {
			Message.error('订单已超过一天，无法取消');
		} else {
			fetch('/api/bill/cancel', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded',
				},
				body: `billId=${bill.billId}`,
			}).then((res) => {
				if (res.status === 200) {
					Message.success('取消成功');
				}
			});
		}
	};
	const headerName = ['订单号', '商品', '总价', '地址', '数量', '交易时间'];
	return (
		<>
			<Header />
			<main className={style.main}>
				<Display
					data={bills}
					headerName={headerName}
					headers={headers}
					keys={'billId'}
					action={handleCancel}
					actionName={'取消'}
				></Display>
			</main>
		</>
	);
};
export default Cart;

import { format, parse, parseISO } from 'date-fns';
import Router from 'next/router';
import { useEffect, useState } from 'react';
import useSWR from 'swr';
import Display from '../../components/Display';
import Modal from '../../components/modal';
import PageControl from '../../components/PageControl';
import Side from '../../components/Side';
import { useAuth } from '../../lib/AuthorContext';
import style from '../../styles/Login.module.css';
import utils from '../../styles/utils.module.css';
import fetcher from '../../utils/fetcher';
const Commodities = () => {
	const { auth, setAuth } = useAuth();
	useEffect(() => {
		if (auth == '') {
			Router.push('/admin');
		}
	}, [auth]);
	const [close, setClose] = useState(false);
	const [bill, setBill] = useState({});
	const [page, setPage] = useState(0);
	const { data, error } = useSWR(
		`/api/bill/all?page=${page}&pageSize=10`,
		fetcher,
		{
			refreshInterval: 1000,
		}
	);
	if (error) return <div>failed to load</div>;
	if (!data) return <div>loading...</div>;

	const headers = [
		'commodityNames',
		'totalPrice',
		'userName',
		'address',
		'nums',
		'transactionTime',
	];
	const headerName = ['商品', '总价', '用户名', '地址', '数量', '交易时间'];
	console.log(data);
	data.data.map((item) => {
		item.transactionTime = format(
			parseISO(item.transactionTime),
			'yyyy-MM-dd hh:mm:ss'
		);
	});
	const Modify = () => {
		const [address, setAddress] = useState(bill.address);
		const handleDelete = () => {
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
				alert('订单已超过一天，无法取消');
				return;
			} else {
				fetch('/api/bill/delete', {
					method: 'POST',
					headers: {
						Authorization: auth,
						'Content-Type': 'application/x-www-form-urlencoded',
					},
					body: `billId=${bill.billId}`,
				}).then((res) => {
					if (res.status === 200) {
						setClose(false);
					} else if (res.status === 401) {
						setAuth('');
						Router.push('/admin');
					}
				});
			}
		};
		const handleModify = () => {
			fetch('/api/bill/update', {
				method: 'POST',
				headers: {
					Authorization: auth,
					'Content-Type': 'application/x-www-form-urlencoded',
				},
				body: `billId=${bill.billId}&address=${address}`,
			}).then((res) => {
				if (res.status === 200) {
					setClose(false);
				} else if (res.status === 401) {
					setAuth('');
					Router.push('/admin');
				}
			});
		};
		return (
			<div className={style.form}>
				<div>
					<label className={style.label}>配送地址:</label>
					<input
						className={style.input}
						value={address}
						onChange={(e) => setAddress(e.target.value)}
					></input>
				</div>
				<button className={style.inputText} onClick={handleModify}>
					修改
				</button>
				<button className={style.submitText} onClick={handleDelete}>
					删除
				</button>
			</div>
		);
	};
	return (
		<>
			<h2 className={utils.center}>订单管理</h2>
			<Side />
			<Display
				data={data.data}
				headers={headers}
				actionName="修改"
				action={(e) => {
					setBill(e);

					setClose(!close);
				}}
				headerName={headerName}
				keys={'billId'}
			/>
			<PageControl page={page} setPage={setPage} maxPage={0} />
			<Modal close={close} setClose={setClose}>
				<Modify />
			</Modal>
		</>
	);
};
export default Commodities;

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
import Add from './add';
const Commodities = () => {
	const { auth } = useAuth();
	useEffect(() => {
		if (auth == '') {
			Router.push('/admin');
		}
	}, [auth]);
	const [commodity, setCommodity] = useState({});
	const [close, setClose] = useState(false);
	const [page, setPage] = useState(0);

	const max = useSWR(`/api/commodity/count`, fetcher);
	const { data, error } = useSWR(
		`/api/commodities?page=${page}&pageSize=10`,
		fetcher,
		{ refreshInterval: 1000 }
	);
	if (error) return <div>failed to load</div>;
	if (!data) return <div>loading...</div>;
	if (!max.data) return <div>loading...</div>;
	const maxPage = Math.ceil(max?.data.data / 10) || 0;
	console.log(maxPage);
	const headers = [
		'commodityName',
		'commodityPrice',
		'category',
		'commodityDes',
	];
	const Modify = () => {
		return (
			<div className={style.form}>
				<input className={style.input}></input>
			</div>
		);
	};
	const headerName = ['商品名', '价格', '类别', '描述'];
	return (
		<>
			<h2 className={utils.center}>商品管理</h2>
			<Side />
			<Display
				data={data.data}
				headers={headers}
				actionName="修改"
				action={(e) => {
					setCommodity({ ...commodity, ...e }), setClose(true);
				}}
				headerName={headerName}
				keys={'commodityId'}
			/>
			<PageControl page={page} setPage={setPage} maxPage={maxPage} />
			<Modal setClose={setClose} close={close}>
				<Add commodity={commodity} setClose={setClose}></Add>
			</Modal>
		</>
	);
};
export default Commodities;

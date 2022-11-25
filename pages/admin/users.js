import Router from 'next/router';
import { useEffect, useState } from 'react';
import useSWR from 'swr';
import Display from '../../components/Display';
import { Message } from '../../components/Message';
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
	const [page, setPage] = useState(0);
	const { data, error } = useSWR(
		`/api/user/all?page=${page}&pageSize=10`,
		fetcher,
		{
			refreshInterval: 1000,
		}
	);
	const [user, setUser] = useState({});
	const [close, setClose] = useState(false);
	if (error) return <div>failed to load</div>;
	if (!data) return <div>loading...</div>;
	const headers = ['userName', 'userPwd', 'address'];
	const headerName = ['用户名', '密码', '地址'];
	const Modify = () => {
		const handleDelete = () => {
			fetch('/api/user/delete', {
				method: 'POST',
				headers: {
					Authorization: auth,
					'Content-Type': 'application/x-www-form-urlencoded',
				},
				body: `userId=${user.userId}`,
			}).then((res) => {
				if (res.status === 200) {
					Message.success('删除成功');
					setClose(false);
				} else if (res.status === 401) {
					setAuth('');
					Router.push('/admin');
				}
			});
		};
		const handleModify = () => {
			fetch('/api/user/update', {
				method: 'POST',
				headers: {
					Authorization: auth,
					'Content-Type': 'application/x-www-form-urlencoded',
				},
				body: `userName=${name}&userPwd=${pwd}&userId=${user.userId}&address=${address}`,
			}).then((res) => {
				if (res.status === 200) {
					Message.success('修改成功');
					setClose(false);
				} else if (res.status === 401) {
					setAuth('');
					Router.push('/admin');
				}
			});
		};
		const [name, setName] = useState(user.userName);
		const [pwd, setPwd] = useState(user.userPwd);
		const [address, setAddress] = useState(user.address);
		return (
			<div className={style.form}>
				<div>
					<label className={style.label}>用户昵称:</label>
					<input
						className={style.input}
						value={name}
						onChange={(e) => setName(e.target.value)}
					></input>
				</div>
				<div>
					<label className={style.label}>用户密码:</label>
					<input
						className={style.input}
						value={pwd}
						onChange={(e) => setPwd(e.target.value)}
					></input>
				</div>
				<div>
					<label className={style.label}>用户地址:</label>
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
			<h2 className={utils.center}>用户管理</h2>
			<Side />
			<Display
				data={data.data}
				headers={headers}
				headerName={headerName}
				actionName='修改'
				action={(e) => {
					setUser({ ...user, ...e });
					setClose(true);
				}}
				keys={'userId'}
			/>
			<PageControl page={page} setPage={setPage} maxPage={0}></PageControl>
			<Modal close={close} setClose={setClose}>
				<Modify />
			</Modal>
		</>
	);
};
export default Commodities;

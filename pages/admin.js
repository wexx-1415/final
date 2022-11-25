import Router from 'next/router';
import { useState } from 'react';
import { Message } from '../components/Message';
import { useAuth } from '../lib/AuthorContext';
import style from '../styles/Login.module.css';
const Admin = () => {
	const { auth, setAuth } = useAuth();
	if (auth != '') {
		Router.push('/admin/add');
	}
	const [userName, setUserName] = useState('');
	const [password, setPassword] = useState('');
	const handleSubmit = (e) => {
		e.preventDefault();
		console.log('userName', userName);
		console.log('password', password);
		fetch('api/admin/login', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded',
			},
			body: `name=${userName}&pass=${password}`,
		}).then((res) => {
			if (res.ok) {
				console.log(res.headers.get('Authorization'));
				const token = res.headers.get('Authorization');
				setAuth(token);
				Router.push('/admin/add');
			} else {
				Message.error('用户名或密码错误');
			}
		});
	};
	return (
		<div className={style.form}>
			<input
				className={style.input}
				value={userName}
				onChange={(e) => {
					setUserName(e.target.value);
				}}
				type='text'
				placeholder='用户名'
			/>
			<input
				className={style.input}
				value={password}
				onChange={(e) => {
					setPassword(e.target.value);
				}}
				type='password'
				placeholder='密码'
			/>
			<button onClick={handleSubmit} className={style.submit}>
				Login
			</button>
		</div>
	);
};
export default Admin;

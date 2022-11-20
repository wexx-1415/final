import { useState } from 'react';
import { useUser } from '../lib/UserContext';
import style from '../styles/Login.module.css';
const Login = ({ setClose }) => {
	const [userName, setUserName] = useState('');
	const [password, setPassword] = useState('');
	const [address, setAddress] = useState('');
	const {  setUser } = useUser();
	const handleRegister = (e) => {
		e.preventDefault();
		fetch('/api/register', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded',
			},
			body: `userName=${userName}&userPwd=${password}&address=${address}`,
		})
			.then((res) => res.json())
			.then((data) => {
				if (data.code === '0') {
					setUser(data.data);
					setClose(false);
					localStorage.setItem('user', JSON.stringify(data.data));
				}
			});
	};
	const handleSubmit = (e) => {
		e.preventDefault();
		console.log('userName', userName);
		console.log('password', password);
		fetch('/api/login', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded',
			},
			body: `userName=${userName}&userPwd=${password}`,
		})
			.then((res) => {
				if (res.ok) {
					console.log('Login successful');
					console.log(res.headers.get('Authorization'));
					localStorage.setItem('token', res.headers.get('Authorization'));
					setClose(false);
					return res.json();
				} else {
					console.log('Login failed');
					return res.json();
				}
			})
			.then((data) => {
				if (data.data != null) {
					setUser(data.data);
					localStorage.setItem('user', JSON.stringify(data.data));
				} else {
					alert(data.msg);
				}
			});
	};

	return (
		<form onSubmit={handleSubmit} className={style.form}>
			<h2>联想会员登录</h2>
			<input
				className={style.input}
				type="text"
				placeholder="用户名"
				value={userName}
				onChange={(e) => setUserName(e.target.value)}
			/>
			<input
				placeholder="密码"
				className={style.input}
				type="password"
				value={password}
				onChange={(e) => setPassword(e.target.value)}
			/>
			<input
				placeholder="地址,注册时输入"
				className={style.input}
				type="text"
				value={address}
				onChange={(e) => setAddress(e.target.value)}
			/>
			<button className={style.submit} onClick={handleSubmit}>
				Login
			</button>
			<button className={style.submit} onClick={handleRegister}>
				register
			</button>
		</form>
	);
};
export default Login;

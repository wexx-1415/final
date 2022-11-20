import Image from 'next/image';
import Link from 'next/link';
import { useState } from 'react';
import useSWR from 'swr';
import Login from '../components/Login';
import Modal from '../components/modal';
import { useUser } from '../lib/UserContext';
import style from '../styles/Header.module.css';
import fetcher from '../utils/fetcher';
const SearchResult = (search) => {
	search = search.data;
	const { data, error } = useSWR(`/api/search?name=${search}`, fetcher);
	if (error) return <div className={style.result}>failed to load</div>;
	if (!data) return <div className={style.result}>loading...</div>;
	if (!error && data.data) {
		return (
			<div className={style.result}>
				{data.data.length != 0
					? data.data.map((item) => (
							<Link
								key={item.commodityId}
								href={`/commodity/${item.commodityId}`}
							>
								<div>{item.commodityName}</div>
							</Link>
					  ))
					: '没有搜索结果'}
			</div>
		);
	} else {
		return <div></div>;
	}
};
const Header = () => {
	const { user, setUser } = useUser();
	const [close, setClose] = useState(false);
	let [search, setSearch] = useState('');
	let OnSearch = (e) => {
		console.log(e.target.value);
		setSearch(e.target.value);
	};
	const UserBar = () => {
		return user != null ? (
			<>
				<Link href={`/user/${user.userId}`}>
					<div>查看订单</div>
				</Link>
				<div
					style={{ cursor: 'pointer', paddingLeft: '10px' }}
					onClick={() => {
						localStorage.removeItem('user');
						setUser(null);
					}}
				>
					退出登录
				</div>
			</>
		) : (
			<div onClick={() => setClose(true)}>登录</div>
		);
	};
	return (
		<>
			<Modal close={close} setClose={setClose}>
				<Login setUser={setUser} setClose={setClose} />
			</Modal>
			<header className={style.header}>
				<ul className={style.headerUl}>
					<li>
						<Link href="/">
							<Image
								src="/img/logo.png"
								alt="logo"
								width={190}
								priority
								height={36}
							/>
						</Link>
					</li>
					<li>
						<Link href="/category/轻薄本">轻薄本</Link>
					</li>
					<li>
						<Link href="/category/拯救者">拯救者</Link>
					</li>
					<li>
						<Link href="/category/周边">周边</Link>
					</li>
					<li>
						<Link href="/category/台式机">台式机</Link>
					</li>
					<li>
						<Link href={'/cart'}>购物车</Link>
					</li>
				</ul>
				<UserBar />
				<div className={style.search}>
					<span>
						<Image src="/pic/查找.png" alt="search" width={30} height={30} />
					</span>
					<input type="text" value={search} onChange={OnSearch}></input>
					{search == '' ? null : <SearchResult data={search} />}
				</div>
			</header>
		</>
	);
};
export default Header;

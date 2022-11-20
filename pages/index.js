import Head from 'next/head';
import Image from 'next/image';
import { useEffect, useState } from 'react';
import Header from '../components/Header';
import ProductBoard from '../components/ProductBoard';
import Swiper from '../components/Swiper';
import { useUser } from '../lib/UserContext';
import style from '../styles/Swiper.module.css';
import utils from '../styles/utils.module.css';
const imgs = [
	'km7ferrwq3omgzu7l4oxe1vqsuf6cu234441.png',
	'l80dm65qe6uv6bqcscp0ugly7tkhrt482992 (自定义).png',
	'i5p6sbu081edm9wka1yyy00jg0p7x6079231.png',
	'wz7az6vdumywveb6mxp5v1p3apvyry824094.png',
	'nqrknav8uwncpxumh3dxeddqahreuw378176.png',
];
const SwiperItem = () => {
	return imgs.map((item) => {
		return (
			<li className={style.li} key={item}>
				<Image
					alt={item}
					src={'/img/' + item}
					width={1200}
					height={470}
				></Image>
			</li>
		);
	});
};

export default function Home() {
	const { user, setUser } = useUser();
	const [close, setClose] = useState(false);
	useEffect(() => {
		if (localStorage.getItem('user')) {
			setUser(JSON.parse(localStorage.getItem('user')));
		}
	}, [setUser]);
	return (
		<>
			<Head>
				<title>lenovo shop</title>
			</Head>
			<Header />
			<div className={utils.center} style={{ marginTop: '20px' }}>
				<Swiper width={1200} count={5}>
					<SwiperItem />
				</Swiper>
			</div>
			<ProductBoard
				title="轻薄本"
				category={'轻薄本'}
				page={0}
				priority
				img="/pic/a254h5xducyuncnx3ktwak3enjq35r745294.jpg"
			/>
			<ProductBoard
				title="台式机"
				category={'台式机'}
				page={0}
				priority
				img="/pic/u4grznf0a9n9szl2d7xodw8i489rf6310043.jpg"
			/>
			<ProductBoard
				title="周边"
				category={'周边'}
				page={0}
				priority
				img="/pic/7szcg37g9wvvt95q1j16h47ckalsk2332046.jpg"
			/>
			<ProductBoard
				title="拯救者"
				category={'拯救者'}
				page={0}
				priority
				img="/pic/w538r43dzkh8w37gc2rzz67bry7d37147894.jpg"
			/>
			<div>{user?.userId}</div>
		</>
	);
}

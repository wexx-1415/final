import Image from 'next/image';
import React, { useEffect, useState } from 'react';
import style from '../styles/Swiper.module.css';
const Swiper = ({ children, width, count }) => {
	width = width || 256;

	console.log('count', count);
	let [left, setLeft] = useState(0);
	useEffect(() => {
		const timer = setInterval(() => {
			setLeft((left) => (left >= (count - 1) * width ? 0 : left + width));
		}, 3000);
		return () => {
			clearInterval(timer);
		};
	}, [count, width]);

	return (
		<div className={style.wrapper} style={{ width: `${width}px` }}>
			<div
				className={style.selector}
				style={{ left: 0 }}
				onClick={() => {
					setLeft((left) => (left == 0 ? (count - 1) * width : left - width));
				}}
			>
				<Image
					alt="上一个"
					src={'/img/向左.png'}
					width={100}
					height={100}
				></Image>
			</div>
			<div
				className={style.selector}
				style={{ right: 0 }}
				onClick={() => {
					setLeft((left) => (left >= (count - 1) * width ? 0 : left + width));
				}}
			>
				<Image
					alt="下一个"
					src={'/img/下一个.png'}
					width={100}
					height={100}
				></Image>
			</div>
			<div
				className={style.item}
				style={{
					transform: `translate3d(-${left}px,0,0)`,
				}}
			>
				{children}
			</div>
		</div>
	);
};
export default Swiper;

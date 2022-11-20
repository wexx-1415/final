import Image from 'next/image';
import { useRef } from 'react';
import GradText from '../components/GradText';
import { useCart } from '../lib/CartContext';
import { useUser } from '../lib/UserContext';
import style from '../styles/CommodityDetail.module.css';
/**
 * @param {Object} props
 * @param {Object} props.commodity
 * @param {string} props.commodity.commodityName
 */
const CommodityDetail = ({ commodity }) => {
	const ref = useRef();
	const { user } = useUser();
	const { cart, setCart } = useCart();
	const Guide = ({ guideName, guideItems }) => {
		return (
			<div className={style.guide}>
				<span>{guideName}</span>
				<div className={style.guideItems}>
					{guideItems.map((item) => (
						<button className={style.guideItem} key={item}>
							{item}
						</button>
					))}
				</div>
			</div>
		);
	};
	const OnAddToCart = (e) => {
		e.preventDefault();
		console.log('add to cart');
		if (!user) {
			alert('请先登录');
			// ref.current.show();
			return;
		}
		setCart([...cart, commodity]);
		console.log(cart);
	};
	const OnBuy = (e) => {
		e.preventDefault();
		console.log('buy');
		if (!user) {
			alert('请先登录');
			return;
		}
		fetch('/api/buy', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded',
			},
			body: `CommodityIds={"Ids":[${commodity.commodityId}]}&UserId=${user.userId}&Address=${user.address}&Nums={"Nums":[1]}`,
		});
	};
	return (
		<>
			<main className={style.main}>
				<Image
					src={`/pic/${commodity.commodityPicPath}`}
					alt="search"
					width={520}
					height={520}
				/>
				<div className={style.detail}>
					<h2>{commodity.commodityName}</h2>
					<p>{commodity.commodityDes}</p>
					<span>￥{commodity.commodityPrice}</span>
					<GradText text={'Buy Now Take It Home'}></GradText>
					<button className={style.buy} onClick={OnBuy}>
						立即购买
					</button>
					<button className={style.add} onClick={OnAddToCart}>
						加入购物车
					</button>
				</div>
				{/* <dialog ref={ref}>sssssss</dialog> */}
			</main>
		</>
	);
};
export default CommodityDetail;

import { useState } from 'react';
import Header from '../components/Header';
import { Message } from '../components/Message';
import NumButton from '../components/NumButton';
import { useCart } from '../lib/CartContext';
import { useUser } from '../lib/UserContext';
import style from '../styles/Cart.module.css';
const Cart = () => {
	const { user } = useUser();
	const { cart, setCart } = useCart();
	let commodityIds = [];
	let index = [];
	let [num, setNum] = useState(Array(cart.length).fill(1));
	const Bar = () => {
		const onSettle = () => {
			if (commodityIds.length == 0) {
				return;
			}
			let commodityNums = [];
			for (let i = 0; i < index.length; i++) {
				commodityNums.push(num[index[i]]);
			}
			fetch('/api/buy', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded',
				},
				body: `CommodityIds={"Ids":[${commodityIds.join(',')}]}&UserId=${
					user.userId
				}&Address=${user.address}&Nums={"Nums":[${commodityNums.join(',')}]}`,
			}).then((res) => {
				if (res.status === 200) {
					console.log(cart, commodityIds);
					Message.success('购买成功');
					setCart(
						cart.filter(
							(item) => commodityIds.indexOf(item.commodityId.toString()) === -1
						)
					);
					commodityIds = [];
				}
			});
		};
		const onDelete = () => {
			setCart(
				cart.filter(
					(item) => commodityIds.indexOf(item.commodityId.toString()) === -1
				)
			);
			Message.success('删除成功');
			commodityIds = [];
		};
		return (
			<div className={style.bar}>
				<button className={style.delete} onClick={onDelete}>
					删除
				</button>
				<button className={style.buy} onClick={onSettle}>
					结算
				</button>
			</div>
		);
	};

	const onChange = (e) => {
		// console.log(commodityIds);
		let commodityId = e.target.id;
		console.log(commodityId);
		if (commodityIds.indexOf(commodityId.toString()) == -1) {
			commodityIds.push(commodityId);
			index.push(cart.findIndex((item) => item.commodityId == commodityId));
		} else {
			commodityIds = commodityIds.filter(
				(item) => item !== commodityId.toString()
			);
			index = index.filter(
				(item) =>
					item !== cart.findIndex((item) => item.commodityId == commodityId)
			);
		}
	};
	const Select = ({ commodity, onChange }) => {
		return (
			<label className={style.check} htmlFor={commodity.commodityName}>
				<input
					type='checkbox'
					id={commodity.commodityId}
					name={commodity.commodityName}
					onChange={onChange}
				/>
			</label>
		);
	};
	const CartItem = ({ commodities }) => {
		// const [count, setCount] = useState(1);
		return commodities.map((commodity, index) => {
			return (
				<div key={commodity.commodityId} className={style.cart}>
					<div style={{ gridArea: `${index + 2}/1/${index + 3}/2` }}>
						<Select commodity={commodity} onChange={onChange}></Select>
					</div>
					<div style={{ gridArea: `${index + 2}/2/${index + 3}/4` }}>
						{commodity.commodityName}
					</div>
					<div style={{ gridArea: `${index + 2}/4/${index + 3}/5` }}>
						{commodity.commodityPrice}
					</div>
					<div style={{ gridArea: `${index + 2}/5/${index + 3}/6` }}>
						{
							<NumButton
								setNum={setNum}
								index={index}
								num={num}
								max={commodity.nums}
							></NumButton>
						}
					</div>
					<div style={{ gridArea: `${index + 2}/6/${index + 3}/7` }}>
						{+commodity.commodityPrice * num[index]}
					</div>
				</div>
			);
		});
	};
	const CartTitle = () => {
		return (
			<div className={style.cart}>
				<div style={{ gridArea: '1/1/2/2' }}>选择</div>
				<div style={{ gridArea: '1/2/2/4' }}>商品</div>
				<div style={{ gridArea: '1/4/2/5' }}>单价</div>
				<div style={{ gridArea: '1/5/2/6' }}>数量</div>
				<div style={{ gridArea: '1/6/2/7' }}>小计</div>
			</div>
		);
	};
	return (
		<>
			<Header />
			<main className={style.main}>
				{cart.length > 0 ? (
					<>
						<CartTitle />
						<CartItem commodities={cart} />
						<Bar />
					</>
				) : (
					<div>购物车空空如也</div>
				)}
			</main>
		</>
	);
};
export default Cart;

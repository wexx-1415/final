import { useState } from 'react';
import style from '../styles/NumButton.module.css';
const NumButton = ({ num, max, index, setNum }) => {
	const [count, setCount] = useState(num[index]);
	const onAdd = () => {
		if (count < max) {
			setCount(count + 1);
			let newNum = [...num];
			newNum[index] = count + 1;
			console.log(num);
			setNum(newNum);
		}
	};
	const onMinus = () => {
		if (count > 1) {
			setCount(count - 1);
			let newNum = [...num];
			newNum[index] = count - 1;
			setNum(newNum);
		}
	};
	return (
		<div className={style.num}>
			<button onClick={onMinus}>-</button>
			<span>{count}</span>
			<button onClick={onAdd}>+</button>
		</div>
	);
};
export default NumButton;

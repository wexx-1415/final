import style from '../styles/utils.module.css';
const Test = ({ text }) => {
	return (
		<div>
			<span className={style['gradient-text']}>{text}</span>
		</div>
	);
};
export default Test;

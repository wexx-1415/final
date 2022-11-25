import { Message } from '../components/Message';
import style from '../styles/utils.module.css';
const Test = () => {
	return (
		<div>
			<span className={style['gradient-text']}>Test Page</span>
			<button onClick={() => Message.error('This is a test message')}>
				Test Message
			</button>
		</div>
	);
};
export default Test;

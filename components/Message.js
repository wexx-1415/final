import { nanoid } from 'nanoid';
import Image from 'next/image';
import { useEffect } from 'react';
import { createRoot } from 'react-dom/client';
import style from '../styles/Message.module.css';
let root;
let messages = [];
const getContainer = () => {
	let container = document.getElementById('container');
	if (!container) {
		container = document.createElement('div');
		container.id = 'container';
		container.className = 'container';
		document.body.appendChild(container);
	}
	return container;
};
const MessageEl = ({ message }) => {
	useEffect(() => {
		const timeout = setTimeout(() => {
			messages = messages.filter((m) => m.id !== message.id);
			render();
		}, 3000);
		return () => clearTimeout(timeout);
	}, [message.id]);
	return (
		<div className={style.message}>
			<Image
				alt={message.type}
				width={16}
				height={16}
				src={`/img/${message.type}.png`}
			></Image>
			<div>{message.message}</div>
		</div>
	);
};
const addMessage = (message) => {
	message.id = nanoid();
	messages.push(message);
	render();
};
const render = () => {
	const container = getContainer();
	if (!root) {
		root = createRoot(container);
	}
	root.render(
		messages.map((message) => <MessageEl key={message.id} message={message} />)
	);
};
export const Message = {
	error: (message) => addMessage({ type: 'error', message }),
	success: (message) => addMessage({ type: 'success', message }),
};

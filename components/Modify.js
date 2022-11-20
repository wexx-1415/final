import React, { useState } from 'react';
const Modify = ({ User }) => {
	const { userId, userName, address } = User;
	// const { user, setUser } = useUser();
	const [close, setClose] = useState(false);
	const [name, setName] = useState(userId);
	const [UserAddress, setAddress] = useState('');
	return (
		<>
			<div>{name}</div>
		</>
	);
};
export default Modify;

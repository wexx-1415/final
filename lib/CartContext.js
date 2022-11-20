import React, { useContext, useState } from 'react';
export const CartContext = React.createContext({
	cart: [],
	setCart: () => {},
});
export const useCart = () => useContext(CartContext);
export const CartProvider = ({ children }) => {
	const [cart, setCart] = useState([]);
	return (
		<CartContext.Provider value={{ cart, setCart }}>
			{children}
		</CartContext.Provider>
	);
};

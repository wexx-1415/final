import React, { useContext, useState } from 'react';
export const AuthContext = React.createContext({
	auth: '',
	setAuth: () => {},
});
export const useAuth = () => useContext(AuthContext);
export const AuthProvider = ({ children }) => {
	const [auth, setAuth] = useState('');
	return (
		<AuthContext.Provider value={{ auth, setAuth }}>
			{children}
		</AuthContext.Provider>
	);
};

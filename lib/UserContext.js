import React, { useContext, useState } from 'react';
export const UserContext = React.createContext({
	user: null,
	setUser: () => {},
});
export const useUser = () => useContext(UserContext);
export const UserProvider = ({ children }) => {
	const [user, setUser] = useState(null);
	return (
		<UserContext.Provider value={{ user, setUser }}>
			{children}
		</UserContext.Provider>
	);
};

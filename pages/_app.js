import { AuthProvider } from '../lib/AuthorContext';
import { CartProvider } from '../lib/CartContext';
import { UserProvider } from '../lib/UserContext';
import '../styles/globals.css';
function MyApp({ Component, pageProps }) {
	return (
		<UserProvider>
			<CartProvider>
				<AuthProvider>
					<Component {...pageProps} />
				</AuthProvider>
			</CartProvider>
		</UserProvider>
	);
}

export default MyApp;

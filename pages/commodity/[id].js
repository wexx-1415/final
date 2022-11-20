import Head from 'next/head';
import { useRouter } from 'next/router';
import { useEffect } from 'react';
import useSWR from 'swr';
import CommodityDetail from '../../components/CommodityDetail';
import Header from '../../components/Header';
import { useUser } from '../../lib/UserContext';
import fetcher from '../../utils/fetcher';
const Commodity = () => {
	const { user, setUser } = useUser();
	useEffect(() => {
		if (localStorage.getItem('user')) {
			setUser(JSON.parse(localStorage.getItem('user')));
		}
	}, [setUser]);
	const router = useRouter();
	const { id } = router.query;
	const { data, error } = useSWR(`/api/commodity?id=${id}`, fetcher);
	if (error) return <div>failed to load</div>;
	if (!data) return <div>loading...</div>;
	return (
		<>
			<Head>
				<title>lenovo shop</title>
			</Head>
			<Header />

			<CommodityDetail commodity={data} />
			{/* <div>{data.models}</div> */}
		</>
	);
};
export default Commodity;

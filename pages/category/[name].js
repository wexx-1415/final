import { useRouter } from 'next/router';
import { useEffect, useState } from 'react';
import useSWR from 'swr';
import Header from '../../components/Header';
import ResultBoard from '../../components/ResultBoard';
import fetcher from '../../utils/fetcher';
const Category = () => {
	const router = useRouter();
	let [name, setName] = useState('');
	useEffect(() => {
		if (router.isReady) {
			// Code using query
			setName(router.query.name);
		}
	}, [router.isReady, router.query.name]);
	const [page, setPage] = useState(0);
	const { data, error } = useSWR(
		`/api/commodity/category/max?category=${name}&size=15`,
		fetcher
	);
	const maxPage = data?.data;
	const PageControl = ({ maxPage, page, setPage }) => {
		const prePage = () => {
			if (page > 0) {
				setPage(page - 1);
			}
		};
		const nextPage = () => {
			if (page < maxPage) {
				setPage(page + 1);
			}
		};
		return (
			<div style={{ textAlign: 'right' }}>
				<button onClick={prePage}>上一页</button>
				<span style={{ padding: '5px' }}>{page + 1}</span>
				<button onClick={nextPage}>下一页</button>
			</div>
		);
	};
	return (
		<>
			<Header />
			<main>
				<ResultBoard category={name} page={page}></ResultBoard>
				<PageControl maxPage={maxPage} setPage={setPage} page={page} />
			</main>
		</>
	);
};
export default Category;

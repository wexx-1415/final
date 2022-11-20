import useSWR from 'swr';
import style from '../styles/ResultBoard.module.css';
import fetcher from '../utils/fetcher';
import ProductCard from './ProductCard';
const ResultBoard = ({ page, category }) => {
	let num = 5;
	const { data, error } = useSWR(
		`/api/commodity/category?category=${category}&page=${page}&pageSize=${
			num * 3
		}`,
		fetcher
	);
	if (error) return <div>failed to load</div>;
	if (!data) return <div>loading...</div>;
	const cards = data.data.map((product, index) => {
		return (
			<ProductCard
				key={product.commodityId}
				product={product}
				gridArea={`${Math.floor(index / num) + 1}/${(index % num) + 1}/${
					Math.floor(index / num) + 2
				}/${(index % num) + 2}`}
			/>
		);
	});
	return <div className={style.wrapper}>{cards}</div>;
};
export default ResultBoard;

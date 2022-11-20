import Image from 'next/image';
import useSWR from 'swr';
import style from '../styles/ProductBoard.module.css';
import fetcher from '../utils/fetcher';
import ProductCard from './ProductCard';
const ProductBoard = ({ title, page, img, category }) => {
	let num = 4;
	const { data, error } = useSWR(
		`/api/commodity/category?category=${category}&page=${page}&pageSize=${
			num * 2
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
				gridArea={`${Math.floor(index / num) + 1}/${(index % num) + 2}/${
					Math.floor(index / num) + 2
				}/${(index % num) + 3}`}
			/>
		);
	});
	return (
		<div style={{ margin: '0 auto', width: '1200px' }}>
			<h2>{title}</h2>
			<div className={style.wrapper}>
				<Image
					src={img}
					alt={title}
					width={230}
					height={542}
					priority
					style={{ gridArea: '1/1/3/2', padding: '10px 10px 10px 0' }}
				/>
				{cards}
			</div>
		</div>
	);
};
export default ProductBoard;

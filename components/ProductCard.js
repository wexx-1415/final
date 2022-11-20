import Image from 'next/image';
import Link from 'next/link';
import style from '../styles/ProductCard.module.css';
import utils from '../styles/utils.module.css';
const ProductCard = ({ product, gridArea }) => {
	let src = '/pic/' + product.commodityPicPath;
	return (
		<Link
			className={style.card}
			style={{ gridArea: gridArea }}
			href={`/commodity/${product.commodityId}`}
		>
			<Image
				src={src}
				alt={product.commodityName}
				width={160}
				height={160}
				priority
				className={utils.alignSelf}
			/>
			<strong>{product.commodityName}</strong>
			<span>{product.commodityDes}</span>
			<span className={style.price}>￥{product.commodityPrice}</span>
		</Link>
	);
};
export default ProductCard;

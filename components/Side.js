import Link from 'next/link';
import style from '../styles/Side.module.css';
const Side = () => {
	return (
		<div className={style.container}>
			<Link className={style.item} href={'/admin/add'}>
				添加商品
			</Link>

			<Link className={style.item} href={'/admin/users'}>
				用户管理
			</Link>

			<Link className={style.item} href={'/admin/commodities'}>
				商品管理
			</Link>

			<Link className={style.item} href={'/admin/bills'}>
				订单管理
			</Link>
		</div>
	);
};
export default Side;

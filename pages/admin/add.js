import Router from 'next/router';
import { useEffect, useRef, useState } from 'react';
import { Message } from '../../components/Message';
import Side from '../../components/Side';
import { useAuth } from '../../lib/AuthorContext';
import style from '../../styles/Admin.module.css';
import LoginSty from '../../styles/Login.module.css';
import utils from '../../styles/utils.module.css';
const Admin = ({ commodity, setClose }) => {
	const { auth, setAuth } = useAuth();
	useEffect(() => {
		if (auth == '') {
			Router.push('/admin');
		}
	}, [auth]);
	console.dir(commodity);
	const inputRef = useRef();
	const [name, setName] = useState('');
	const [id, setId] = useState(0);
	console.log(name);
	const [price, setPrice] = useState('');
	const [num, setNum] = useState('');
	const [category, setCategory] = useState('');
	const [description, setDescription] = useState('');
	useEffect(() => {
		if (commodity) {
			setId(commodity.commodityId);
			setName(commodity.commodityName);
			setPrice(commodity.commodityPrice);
			setNum(commodity.nums);
			setCategory(commodity.category);
			setDescription(commodity.commodityDes);
		} else {
			setName('');
			setPrice('');
			setNum('');
			setCategory('');
			setDescription('');
		}
	}, [commodity]);
	const OnNameChange = (e) => {
		setName(e.target.value);
	};
	const OnNumChange = (e) => {
		setNum(e.target.value);
	};
	const OnPriceChange = (e) => {
		setPrice(e.target.value);
	};
	const OnCategoryChange = (e) => {
		setCategory(e.target.value);
	};
	const OnDescriptionChange = (e) => {
		setDescription(e.target.value);
	};
	let url = !commodity ? 'add' : 'update';
	const handleClick = () => {
		let formData = new FormData();
		formData.append('file', inputRef.current.files[0]);
		if (commodity) {
			formData.append('CommodityId', id);
			formData.append('Nums', num);
		}
		formData.append('CommodityName', name);
		formData.append('CommodityPrice', price);
		formData.append('Category', category);
		formData.append('CommodityDes', description);
		fetch(`/api/commodity/${url}`, {
			method: 'POST',
			headers: {
				Authorization: auth,
			},
			body: formData,
		}).then((res) => {
			if (res.status == 401) {
				setAuth('');
				Router.push('/admin');
			}
		});
		Message.success('操作成功');
		if (setClose) setClose(false);
	};
	const handleDelete = () => {
		console.log(id);
		fetch('/api/commodity/delete', {
			method: 'POST',
			headers: {
				Authorization: auth,
				'Content-Type': 'application/x-www-form-urlencoded',
			},
			body: `commodityId=${id}`,
		}).then((res) => {
			if (res.status == 401) {
				setAuth('');
				Router.push('/admin');
			}
		});
		Message.success('删除成功');
		if (setClose) setClose(false);
	};
	return (
		<>
			{!commodity ? <h2 className={utils.center}>添加商品</h2> : null}
			{!commodity ? <Side /> : null}
			<div className={style.inputs}>
				<div>
					<label className={style.label} htmlFor='name'>
						商品名称:
					</label>
					<input
						className={LoginSty.input}
						type='text'
						id='name'
						value={name}
						required
						onChange={OnNameChange}
					></input>
				</div>
				<div>
					<label className={style.label} htmlFor='price'>
						商品价格:
					</label>
					<input
						id='price'
						className={LoginSty.input}
						type='text'
						required
						value={price}
						onChange={OnPriceChange}
					></input>
				</div>
				<div>
					<label className={style.label} htmlFor='num'>
						商品数量:
					</label>
					<input
						id='num'
						className={LoginSty.input}
						type='number'
						required
						value={num}
						onChange={OnNumChange}
					></input>
				</div>
				<div>
					<label className={style.label} htmlFor='category'>
						商品类别:
					</label>
					<input
						id='category'
						className={LoginSty.input}
						required
						type='text'
						value={category}
						onChange={OnCategoryChange}
					></input>
				</div>
				<div>
					<label className={style.label} htmlFor='description'>
						商品描述:
					</label>
					<input
						id='description'
						className={LoginSty.input}
						type='text'
						required
						value={description}
						onChange={OnDescriptionChange}
					></input>
				</div>
				<div>
					<label className={style.label} htmlFor='file'>
						商品图片:
					</label>
					<input
						id='file'
						className={LoginSty.input}
						type='file'
						required
						ref={inputRef}
					/>
				</div>
				<button onClick={handleClick} className={style.submit}>
					上传
				</button>
				{!commodity ? null : (
					<button onClick={handleDelete} className={style.submit}>
						删除
					</button>
				)}
			</div>
		</>
	);
};
export default Admin;

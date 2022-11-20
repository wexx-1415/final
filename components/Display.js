import style from '../styles/Display.module.css';
const Display = ({ data, headers, action, keys, headerName, actionName }) => {
	const header = headers.map((item, index) => {
		let s = '';
		if (typeof data[0][item] == 'object') {
			s = data[0][item][Object.keys(data[0][item])[0]].toString();
		} else {
			s = data[0][item];
		}
		return (
			<div
				key={item}
				className={style.item}
				style={{
					width: `${s.length > 10 ? 400 : s.length > 5 ? 200 : 100}px`,
				}}
			>
				{headerName[index]}
			</div>
		);
	});
	const dataSet = data.map((item, index) => {
		// console.log(item);
		return (
			<div
				className={style.column}
				key={data[index][keys]}
				// data-key={data[index][keys]}
			>
				{headers.map((header) => {
					let s = '';
					if (typeof item[header] === 'object') {
						for (let i in item[header]) {
							s += item[header][i].toString() + ' ';
						}
					} else {
						s = item[header].toString();
					}
					return (
						<div
							className={style.item}
							style={{
								width: `${s.length > 10 ? 400 : s.length > 5 ? 200 : 100}px`,
							}}
							key={s}
							// data-key={s}
						>
							{s}
						</div>
					);
				})}
				<span
					className={style.action}
					onClick={() => {
						action(data[index]);
					}}
				>
					{actionName}
				</span>
			</div>
		);
	});
	return (
		<div className={style.container}>
			<div className={style.column}>
				{header}
				<span className={style.item}>操作</span>
			</div>
			{dataSet}
		</div>
	);
};
export default Display;

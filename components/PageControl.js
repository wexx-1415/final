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
		<div
			style={{
				textAlign: 'right',
				marginRight: 'calc(50% - 600px)',
				paddingTop: '10px',
			}}
		>
			<button onClick={prePage}>上一页</button>
			<span style={{ padding: '5px' }}>{page + 1}</span>
			<button onClick={nextPage}>下一页</button>
		</div>
	);
};
export default PageControl;

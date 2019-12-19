<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코코아톡:: 이모티콘</title>
<style type="text/css">
	footer {
		position: absolute;
		bottom: 0;
		width: 100%;
		background: gray;
	}
</style>
</head>
<body>
	<section title="navigationBar">
		<a href="${cp}/emoShop/wishList">좋아요</a>
		<a href="${cp}/emoShop/basket">바구니</a>
	</section>
	
	<section title="emoList" id="emoList">
    	<div class="article-list" id="article-list"></div>
	</section>
    
    <!--
	<footer>
		<ul class="article-list__pagination article-list__pagination--inactive" id="article-list-pagination"></ul>
	</footer>
	-->




<script type="text/javascript">

function getPageId(n) {
	return 'article-page-' +n;
}

function getDocumentHeight() {
    const body = document.body;
    const html = document.documentElement;
    return Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight);
}

function getScrollTop() {
    return (window.pageYOffset !== undefined) ? window.pageYOffset : (document.documentElement || document.body.parentNode || document.body).scrollTop;
}

function getArticleImage() {
    const hash = Math.floor(Math.random() * Number.MAX_SAFE_INTEGER);
    const image = new Image;
    image.className = 'article-list__item__image article-list__item__image--loading';
    image.src = 'http://api.adorable.io/avatars/250/' + hash;
    image.onload = function() {
        image.classList.remove('article-list__item__image--loading');
    };
    return image;
}

function getArticle() {
    const articleImage = getArticleImage();
    const article = document.createElement('article');
    article.className = 'article-list__item';
    article.appendChild(articleImage);
    return article;
}

function getArticlePage(page, articlesPerPage = 16) {
    const pageElement = document.createElement('div');
    pageElement.id = getPageId(page);
    pageElement.className = 'article-list__page';
    while(articlesPerPage--) {
        pageElement.appendChild(getArticle());
    }
    return pageElement;
}

function addPaginationPage(page) {
    const pageLink = document.createElement('a');
    pageLink.href = '#' + getPageId(page);
    pageLink.innerHTML = page;
    const listItem = document.createElement('li');
    listItem.className = 'article-list__pagination__item';
    listItem.appendChild(pageLink);

    articleListPagination.appendChild(listItem);

    if(page === 2) {
        articleListPagination.classList.remove('article-list__pagination--inactive');
    }
}

function fetchPage(page) {
    articleList.appendChild(getArticlePage(page));
}

function addPage(page) {
    fetchPage(page);
    addPaginationPage(page);
}

const articleList = document.getElementById('article-list');
const articleListPagination = document.getElementById('article-list-pagination');
let page = 0;

addPage(++page);

window.onscroll = function() {
	if (getScrollTop() < getDocumentHeight() - window.innerHeight) return;
    addPage(++page);
};

</script>

</body>
</html>
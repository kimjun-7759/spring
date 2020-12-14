/**
 * 댓글용 module 
 * jQuery의 $.ajax, $.getJSON 등을 이용해 비동기방식으로 data(json 포맷 등)를 주고 받는
 * 문법, 방법을 이해해야 한다. 
 */

console.log("Reply Module........");

var replyService = (function () {

	function add(comments, callback, error) {
		console.log("add reply.....................");

		$.ajax({
			type: 'post',
			url: '/replies/new',
			data: JSON.stringify(comments),
			contentType: "application/json; charset=utf-8",
			success: function (resultm, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function (xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}

	function getList(param, callback, error) {

		var board_idx = param.board_idx;
		var page = param.page || 1;

		$.getJSON("/replies/pages/" + board_idx + "/" + page + ".json",
			function (data) {
				if (callback) {
					callback(data);
				}
			}).fail(function (xhr, status, err) {
				if (error) {
					error();
				}
			});
	}

	function remove(comment_idx, callback, error) {
		$.ajax({
			type: 'delete',
			url: '/replies/' + comment_idx,
			success: function (deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error: function (xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function update(comments, callback, error) {
		$.ajax({
			type: 'put',
			url: '/replies/' + comments_comment_idx,
			data: JSON.stringify(comments),
			contentType: "application/json; charset=utf-8",
			success: function (result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function (xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function get(comment_idx, callback, error) {

		$.get("/replies/" + comment_idx + ".json", function (result) {

			if (callback) {
				callback(result);
			}
		}).fail(function (xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	return {
		add: add,
		getList: getList,
		remove: remove,
		update: update,
		get: get
	};
})();

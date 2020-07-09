/**
	{
		"api":1,
		"name":"Random String",
		"description":"Create a random string of length in line 1, from chars in line 2",
		"author":"pwxn",
		"icon":"dice",
		"tags":"random,string"
	}
**/

function main(input) {
  let lines = input.text.split('\n');
  let resultLength = lines[0] > 0 ? lines[0] : 50;
	let corpus = lines[1] ?? 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  let result = '';

	for (let j = 0; j < resultLength; j++) {
    i = Math.floor(Math.random() * corpus.length);
    result = result.concat(corpus[i]);
	}

	input.text = result;
}

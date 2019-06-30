

document.getElementById('loginButton').addEventListener('click', function () {
    var bg = document.querySelector('.bg-modal');
    bg.style.display = 'flex';
});

document.querySelector('.close').addEventListener('click', function () {
    document.querySelector('.bg-modal').style.display = 'none';
});

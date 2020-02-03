function selectedTestCor() {
    var selector = document.getElementById('list_test_corr');
    var value = selector[selector.selectedIndex + 1].value;
    document.getElementById('selectedTestCor').innerHTML = value;
}
function selectedTest() {
    var selector = document.getElementById('list_test');
    var value = selector[selector.selectedIndex + 1].value;
    document.getElementById('selectedTest').innerHTML = value;
}

window.onload = function () {
    selectedTest();
    selectedTestCor();
};
var homeModule = angular.module('homeModule', []);

homeModule.directive('carousel', function() {
    return {
        restrict: 'A',
        link: function(scope, elem) {
            console.log(elem);
            elem.carousel({
                interval: 5000 //changes the speed
            });
        }
    }
});
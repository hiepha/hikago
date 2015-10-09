var commonDirectiveModule = angular.module('commonDirectives', []);

commonDirectiveModule.directive('navBar', function($location) {
    return {
        restrict: 'A',
        link: function(scope, elem) {
            // watch hastag to active navbar item
            scope.$watch(function(){return $location.path()}, function(newValue) {
                elem.children().each(function(){
                    var $this = $(this);
                    var a = $this.children('a');
                    var subContext = newValue.indexOf('/') > 0 ? newValue.substr(newValue.indexOf('/')) : newValue;
                    if (!$this.hasClass('dropdown')
                        && ('#' + subContext) == (a.attr('href'))) {
                        $this.addClass('active');
                    } else {
                        $this.removeClass('active');
                    }
                });
            });
        }
    }
});


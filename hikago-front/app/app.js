var app = angular.module('app', ['ngRoute', 'commonDirectives', 'homeModule']);

app.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
    $routeProvider.when('/', {
        title: 'Home',
        templateUrl: 'app/home/home.html'
    }).when('/course', {
        templateUrl: 'app/course/course.html'
    }).when('/course-details', {
        templateUrl: 'app/course-details/course-details.html'
    });
    //$locationProvider.html5Mode(true);
    //$locationProvider.hashPrefix('!');
}]);
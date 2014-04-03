'use strict';

module.exports = function(grunt) {

    grunt.initConfig({
        paths: {
            dist: 'dist',
            tmp: '.tmp'
        },
        clean: {
            dist: ['<%= paths.dist %>']
        },
		concat: {
			'dist/css/vendors.css': [
				'<%= paths.tmp %>/vendor/normalize/**/*.css',
				'<%= paths.tmp %>/vendor/foundation/**/*.css'
			],
			'dist/css/site.css': [
				'<%= paths.tmp %>/css/github.css',
				'<%= paths.tmp %>/css/site.css'
			],
			'dist/js/modernizr.js': [
				'<%= paths.tmp %>/vendor/modernizr/**/*.js'
			],
			'dist/js/vendors.js': [
				'<%= paths.tmp %>/vendor/jquery/**/*.js',
				'<%= paths.tmp %>/vendor/foundation/**/*.js'
			]
		},
		cssmin: {
			'<%= paths.dist %>/css/app.css': '<%= paths.dist %>/css/app.css'
		},
		uglify: {
			'<%= paths.dist %>/js/modernizr.js': '<%= paths.dist %>/js/modernizr.js',
			'<%= paths.dist %>/js/vendors.js': '<%= paths.dist %>/js/vendors.js'
		},
        rev: {
            dist: {
                files: {
                    src: [
                        '<%= paths.dist %>/js/{,*/}*.js',
                        '<%= paths.dist %>/css/{,*/}*.css',
                    ]
                }
            }
        },
        usemin: {
            html: '<%= paths.tmp %>/**/*.html',
            options: {
                dest: '<%= paths.dist %>'
            }
        },
        htmlmin: {
            dist: {
                options: {
                    removeComments: true,
                    collapseWhitespace: true
                },
                files: [
                    {expand: true, cwd: '<%= paths.tmp %>/', src: '**/*.html', dest: '<%= paths.dist %>'},
               ]
            }
        },
        copy: {
            dist: {
                files: [{
					expand: true,
					cwd: '<%= paths.tmp %>/',
					src: [
						'**/*.png',
						'**/*.ico',
						'**/*.xml'
					],
					dest: '<%= paths.dist %>'
				}]
            }
        },
        connect: {
            options: {
                hostname: '*',
                keepalive: true
            },
            dist: {
                options: {
                    base: '<%= paths.dist %>'
                }
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-usemin');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-rev');
    grunt.loadNpmTasks('grunt-contrib-htmlmin');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-connect');

    grunt.registerTask('build', [
        'clean:dist',
        'concat',
        'cssmin',
        'uglify',
        'rev',
        'usemin',
        'htmlmin',
        'copy:dist'
    ]);
};

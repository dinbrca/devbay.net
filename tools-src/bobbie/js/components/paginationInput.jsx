/**
 * Copyright 2015 David T. Sadler
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

var React = require('react');
var EntriesPerPage = require('./entriesPerPage.jsx');
var PageNumber = require('./pageNumber.jsx');

var PaginationInput = React.createClass({

    render: function () {
        return (
            <fieldSet>
                <legend>Pagination Input</legend>
                <div className='row'>
                    <div className='small-6 columns'>
                        <EntriesPerPage value={this.props.values.entriesPerPage}/>
                    </div>
                    <div className='small-6 columns'>
                        <PageNumber value={this.props.values.pageNumber}/>
                    </div>
                </div>
            </fieldSet>
        );
    }
});

module.exports = PaginationInput;

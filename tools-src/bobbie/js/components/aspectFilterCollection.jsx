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
var PureRenderMixin = React.addons.PureRenderMixin;
var appActions = require('../actions/actions.js');
var AspectFilter = require('./aspectFilter.jsx');

var AddBtn = React.createClass({

    mixins: [PureRenderMixin],

    render: function () {
        return (
            <a className='button postfix' href='#' onClick={this._onClick}>Add</a>
        );
    },

    _onClick: function (e) {
        e.preventDefault();

        appActions.addAspectFilter();
    }
});

var RemoveBtn = React.createClass({

    mixins: [PureRenderMixin],

    render: function () {
        return (
            <a className='button postfix' href='#' onClick={this._onClick}>Remove</a>
        );
    },

    _onClick: function (e) {
        e.preventDefault();

        appActions.removeAspectFilter(this.props.index);
    }
});

var AspectFilterCollection = React.createClass({

    render: function () {
        var numItems = this.props.collection.length;
        var rows = this.props.collection.reduce(function (rows, item, index) {
            rows.push(
                <AspectFilter index={index} values={item}/>
            );

            if (numItems === 1) {
                rows.push(
                    <div className='row'>
                        <div className='small-2 small-offset-4 columns'>
                            <AddBtn/>
                        </div>
                    </div>
                );
            } else if (index < numItems - 1) {
                rows.push(
                    <div className='row'>
                        <div className='small-4 columns end'>
                            <RemoveBtn index={index}/>
                        </div>
                    </div>
                );
            } else {
                rows.push(
                    <div className='row'>
                        <div className='small-4 columns'>
                            <RemoveBtn index={index}/>
                        </div>
                        <div className='small-2 columns end'>
                            <AddBtn/>
                        </div>
                    </div>
                );
            }

            return rows;
        }, []);

        return (
            <div>
                {rows}
            </div>
        );
    }
});

module.exports = AspectFilterCollection;

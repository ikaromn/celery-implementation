import React from "react";
import ReactDOM from "react-dom";
import DataProvider from "./DataProvider";
import Table from "./Table";
import Form from "./Form";
import { BrowserRouter } from 'react-router-dom';
import { Switch, Route } from 'react-router';

ReactDOM.render((
    <BrowserRouter>
        <Switch>
            <Route exact={true} path="/" render={
                (props) => <DataProvider
                    endpoint="/api/lead/"
                    render={
                        data => <Table data={data} />
                    }
                />
            } />
            <Route path="/leads/form/"
                render={
                    (props) => <Form
                        endpoint="/api/lead/"
                    />
                }
            />
        </Switch>
    </BrowserRouter>
), document.getElementById('app'));

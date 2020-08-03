import React from 'react';
import { Switch, Route } from 'react-router-dom'
import Home from './pages/Home'
import Login from './pages/Login'
import SignUp from './pages/SignUp'
import BookList from './pages/BookList'

function App() {
  return (
    <Switch>
      <Route exact path="/login" component={ Login } />
      <Route exact path="/signup" component={ SignUp } />
      <Route exact path="/booklist" component={ BookList } />
      <Route exact path="/" component={ Home } />
    </Switch>
  );
}

export default App;

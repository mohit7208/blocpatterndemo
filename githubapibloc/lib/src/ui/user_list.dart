import 'package:flutter/material.dart';
import 'package:githubapibloc/src/bloc/user_bloc.dart';
import 'package:githubapibloc/src/models/user_response.dart';


class UserList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserListState();
  }
}

class UserListState extends State<UserList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchUsers();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Api',style: TextStyle(color: Colors.white),),
      ),
      body: StreamBuilder(
        stream: bloc.allUsers,
        builder: (context, AsyncSnapshot<UserResponse> snapshot) {
          if (snapshot.hasData) {
            return buildList1(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList1(AsyncSnapshot<UserResponse> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.users.length,
        itemBuilder: (BuildContext context, int index) {
          return getListView(snapshot.data.users[index]);
        });
  }

  

Card getListView(User user) {
    return Card(
        
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            // verticalDirection: VerticalDirection.down,
            children: <Widget>[
              
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('${user.id.toString()}.',
                style: TextStyle(fontSize: 30.0,
                fontWeight: FontWeight.bold,
                ),),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(user.login.toString(),
                style: TextStyle(fontSize: 20.0,),),
              )
            ],
          ),
        ));
  }
}
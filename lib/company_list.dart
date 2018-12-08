import 'package:flutter/material.dart';
import 'company.dart';

const companies = const <Company>[
  const Company(name: 'Atlassian', location: 'Sydney'),
  const Company(name: 'Optiver', location: 'Sydney'),
  const Company(name: 'VGW', location: 'Perth'),
  const Company(name: 'Woodside', location: 'Perth'),
];

class CompanyList extends StatelessWidget {
  final List<Company> companies;

  CompanyList(this.companies);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: companies.length,
      itemBuilder: (context, int) {
        var company = companies[int];
        return ListTile(
          leading: new CircleAvatar(
            child: new Text(company.name[0])
          ),
          title: Text(company.name),
          subtitle: Text(company.location),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'company.dart';
import 'company_widget.dart';

const companies = const <Company>[
  const Company(
      name: 'Atlassian',
      location: 'Sydney',
      image: 'assets/atlassian.webp',
      description:
          'Atlassian Corporation Plc is an Australian enterprise software company that develops products'),
  const Company(
      name: 'Optiver',
      location: 'Sydney',
      image: 'assets/atlassian.webp',
      description: 'Optiver description...'),
  const Company(
      name: 'VGW',
      location: 'Perth',
      image: 'assets/atlassian.webp',
      description: 'VGW description...'),
  const Company(
      name: 'Woodside',
      location: 'Perth',
      image: 'assets/atlassian.webp',
      description: 'Woodside description...'),
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
            child: new Text(company.name[0]),
          ),
          onTap: (){ 
            Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyWidget(company)),
            );
          },
          title: Text(company.name),
          subtitle: Text(company.location),
        );
      },
    );
  }
}

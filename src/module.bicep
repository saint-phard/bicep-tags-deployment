targetScope = 'subscription'

@description('Sensitivity of data hosted by this resource FOR IT ENGINEERING.')
@allowed([
  'non-business'
  'public'
  'general'
  'confidential'
  'highly-confidential'
  'customer'
  'no-data-present'
])
param dataClassification string

@description('Business impact of the resource or supported workload FOR IT ENGINEERING.')
@allowed([
  'low'
  'medium'
  'high'
  'department-critical'
  'mission-critical'
])
param criticality string

@description('The Cost Centre that will be re-charged for the resource FOR IT ASSET MANAGEMENT.')
param costCentre string

@description('Deployment environment of the application, workload, or service FOR IT ENGINEERING.')
param environment string

@description('Owner of the resource, application, workload, or service.')
param owner string

@description('The team that is primarily using the resource, or the application, workload, or service that it supports..')
param owningTeam string

@description('User who requested the creation of this resource.')
param requester string

@description('Name of the workload the resource supports FOR IT ENGINEERING; There will be element of subjectivity here.')
param workload string

@description('Added granularity for workloads like Guidewire that are divided across multiple applications.')
param application string

@description('The Hastings PO Number associated with the resource FOR IT ASSET MANAGEMENT; May need to be changed to a different value over time.')
param poNumber string

@description('The project code associated with the resource; not all resources are associated with a particular project.')
param projectCode string



// Variables
var tags = {
  'dataClassification': dataClassification
  'criticality': criticality
  'costCentre': costCentre
  'environment': environment
  'owner': owner
  'owningTeam': owningTeam
  'requester': requester
  'workload': workload
  'application': application
  'poNumber': poNumber
  'projectCode': projectCode
}


// Resource setup
resource subscriptionTags 'Microsoft.Resources/tags@2021-04-01' = {
  name: 'default'
  scope: subscription()
  properties: {
    tags: tags
  }
}

// Output
output subscriptionTags object = tags

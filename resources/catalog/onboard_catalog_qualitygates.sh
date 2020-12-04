#!/bin/bash -x

#If directory exists continue, otherwise exit
if [[ -d "catalog" ]]; then

    # The context for this script needs to be in examples/onboarding-carts
    echo "Adding the SLI for the Project to all Stages"
    keptn add-resource --project=keptnorders --resource=sli-config-dynatrace.yaml --resourceUri=dynatrace/sli.yaml

    keptn configure monitoring dynatrace --project=keptnorders

    echo "Setting up QualityGate to Staging"
    keptn add-resource --project=keptnorders --stage=staging --service=order --resource=slo-quality-gates.yaml --resourceUri=slo.yaml
    keptn add-resource --project=keptnorders --stage=staging --service=catalog --resource=slo-quality-gates.yaml --resourceUri=slo.yaml
    keptn add-resource --project=keptnorders --stage=staging --service=customer --resource=slo-quality-gates.yaml --resourceUri=slo.yaml
    keptn add-resource --project=keptnorders --stage=staging --service=frontend --resource=slo-quality-gates.yaml --resourceUri=slo.yaml

else 
    echo "The helmcharts for catalog are not present"
fi 


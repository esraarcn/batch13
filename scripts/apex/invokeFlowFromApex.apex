Map<String,Object> inputs = new Map<String,Object>();
inputs.put('AccountId', '0018d00000W2FRSAA3');
inputs.put('AccountName', 'Soft Innovas');
inputs.put('AccountOwnerId', '0058d0000054rRIAAY');
inputs.put('CreatedByName', 'esra');

Flow.Interview invokeFlow = new Flow.Interview.X17_Account_Auto_Launch_Flow(inputs);
invokeFlow.start();
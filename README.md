# ![Dialogue Wise](https://dialoguewise.com/images/logo.png)

[![Pub](https://img.shields.io/pub/v/dialogue_wise.svg?style=flat)](https://pub.dartlang.org/packages/dialogue_wise)

## Dart Package to integrate Dialogue Wise Headless CMS
Dialogue Wise is a Headless CMS that Intelligently Generates &
Delivers Content to Multiple Platforms.
[Read More](https://dialoguewise.com/).

### Prerequisite
You will need Dart installed on your machine.
You can install it from [here](https://dart.dev/get-dart).


## Get content from Dialogue Wise

Getting content is pretty simple. All you need to do is to create a DialogueWiseRequest and then call the getDialogue method.

```
var request = new DialogueWiseRequest();
request.slug = '[Your Slug]';
request.apiKey = '[Your API Key]';
request.emailHash='[Your Email Hash]';

var dialogueWiseService = new DialogueWiseService(new HttpClient()); 
Map res = await dialogueWiseService.getDialogue(request);
```
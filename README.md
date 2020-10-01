# ![Dialogue Wise](https://dialoguewise.com/images/logo.png)

[![Pub](https://img.shields.io/pub/v/dialogue_wise.svg?style=flat)](https://pub.dartlang.org/packages/dialogue_wise)
![Coverage](https://raw.githubusercontent.com/dialoguewise/dart-package/master/coverage_badge.svg?sanitize=true)
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

You can also do image transformations like resize, crop or rotate by setting the `imageTransformation` parameter in the request. For example:

```
request.imageTransformation='w=300';
```

will set the image width as 300. Please checkout the [Docs](https://docs.dialoguewise.com/) for more details on image transformations.


## Search content

The search option will return you all the content that contains the matching keyword. You just need to pass the keyword as part of the DialogueWiseRequest and then call the searchDialogue method.

```
var request = new DialogueWiseRequest();
request.slug = '[Your Slug]';
request.apiKey = '[Your API Key]';
request.emailHash = '[Your Email Hash]';
request.searchKeyword = '[Your Search Keyword]';

var dialogueWiseService = new DialogueWiseService(new HttpClient()); 
Map res = await dialogueWiseService.searchDialogue(request);
```


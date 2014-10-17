## 導入
* bower.jsonのdependenciesにbackbone-relational-amdを追加
* bower installでインストール

## requirejsのmain.js設定
* pathに以下を追加
	- 'backbone-relational-amd':'../bower_components/backbone-relational-amd/backbone-relational'
* requireに以下を追加
	- 'backbone'
	- 'backbone-relational-amd'
* requireの変数設定
	- Backbone
	- backbone-relational-amdの変数は不要

## チェック
```coffee
test_model = new Backbone.RelationalModel()
console.log test_model
```

{"id":"7d015478-86c6-4204-820b-5c339cb9af29","name":"com_example_giftshop_Gift","model":{"source":"INTERNAL","className":"com.example.giftshop.Gift","name":"Gift","properties":[{"name":"deliveryFee","typeInfo":{"type":"BASE","className":"java.math.BigDecimal","multiple":false},"metaData":{"entries":[{"name":"field-label","value":"Fee of this delivery according to the distnace"},{"name":"field-placeHolder","value":"Fee of this delivery according to the distnace"}]}},{"name":"deliveryAddress","typeInfo":{"type":"BASE","className":"java.lang.String","multiple":false},"metaData":{"entries":[{"name":"field-label","value":"Address to deliver this gift"},{"name":"field-placeHolder","value":"Address to deliver this gift"}]}},{"name":"price","typeInfo":{"type":"BASE","className":"java.math.BigDecimal","multiple":false},"metaData":{"entries":[{"name":"field-label","value":"Price of this gift"},{"name":"field-placeHolder","value":"Price of this gift"}]}},{"name":"id","typeInfo":{"type":"BASE","className":"java.lang.Long","multiple":false},"metaData":{"entries":[{"name":"field-label","value":"Identifier"},{"name":"field-placeHolder","value":"Identifier"}]}},{"name":"buyerName","typeInfo":{"type":"BASE","className":"java.lang.String","multiple":false},"metaData":{"entries":[{"name":"field-label","value":"Name of the person buying the gift"},{"name":"field-placeHolder","value":"Name of the person buying the gift"}]}},{"name":"message","typeInfo":{"type":"BASE","className":"java.lang.String","multiple":false},"metaData":{"entries":[{"name":"field-label","value":"Message to be included in the gift card"},{"name":"field-placeHolder","value":"Message to be included in the gift card"}]}},{"name":"type","typeInfo":{"type":"BASE","className":"java.lang.String","multiple":false},"metaData":{"entries":[{"name":"field-label","value":"Type of the gift, i.e.: Flower,"},{"name":"field-placeHolder","value":"Type of the gift, i.e.: Flower,"}]}}],"formModelType":"org.kie.workbench.common.forms.data.modeller.model.DataObjectFormModel"},"fields":[{"placeHolder":"Fee of this delivery according to the distnace","maxLength":100,"id":"field_615005217716299E11","name":"deliveryFee","label":"Fee of this delivery according to the distnace","required":false,"readOnly":false,"validateOnChange":true,"binding":"deliveryFee","standaloneClassName":"java.math.BigDecimal","code":"DecimalBox","serializedFieldClassName":"org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.decimalBox.definition.DecimalBoxFieldDefinition"},{"maxLength":100,"placeHolder":"Type of the gift, i.e.: Flower,","id":"field_0902830737682317E12","name":"type","label":"Type of the gift, i.e.: Flower,","required":false,"readOnly":false,"validateOnChange":true,"binding":"type","standaloneClassName":"java.lang.String","code":"TextBox","serializedFieldClassName":"org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.textBox.definition.TextBoxFieldDefinition"},{"maxLength":100,"placeHolder":"Address to deliver this gift","id":"field_297060057426094E11","name":"deliveryAddress","label":"Where should this  gift be delivered?","required":false,"readOnly":false,"validateOnChange":true,"helpMessage":"","binding":"deliveryAddress","standaloneClassName":"java.lang.String","code":"TextBox","serializedFieldClassName":"org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.textBox.definition.TextBoxFieldDefinition"},{"placeHolder":"Price of this gift","maxLength":100,"id":"field_2127624435802783E11","name":"price","label":"Price","required":false,"readOnly":false,"validateOnChange":true,"helpMessage":"","binding":"price","standaloneClassName":"java.math.BigDecimal","code":"DecimalBox","serializedFieldClassName":"org.kie.workbench.common.forms.fields.shared.fieldTypes.basic.decimalBox.definition.DecimalBoxFieldDefinition"}],"layoutTemplate":{"version":3,"style":"FLUID","layoutProperties":{},"rows":[{"height":"12","properties":{},"layoutColumns":[{"span":"12","height":"12","properties":{},"rows":[],"layoutComponents":[{"dragTypeName":"org.uberfire.ext.plugin.client.perspective.editor.layout.editor.HTMLLayoutDragComponent","properties":{"HTML_CODE":"\u003cb\u003eGift Details\u003c/b\u003e"},"parts":[]}]}]},{"height":"12","properties":{},"layoutColumns":[{"span":"6","height":"12","properties":{},"rows":[],"layoutComponents":[{"dragTypeName":"org.kie.workbench.common.forms.editor.client.editor.rendering.EditorFieldLayoutComponent","properties":{"field_id":"field_297060057426094E11","form_id":"7d015478-86c6-4204-820b-5c339cb9af29"},"parts":[{"partId":"TextBox","cssProperties":{}},{"partId":"Field Label","cssProperties":{}}]}]},{"span":"6","height":"12","properties":{},"rows":[],"layoutComponents":[{"dragTypeName":"org.kie.workbench.common.forms.editor.client.editor.rendering.EditorFieldLayoutComponent","properties":{"field_id":"field_615005217716299E11","form_id":"7d015478-86c6-4204-820b-5c339cb9af29"},"parts":[{"partId":"DecimalBox","cssProperties":{}},{"partId":"Field Label","cssProperties":{}}]}]}]},{"height":"12","properties":{},"layoutColumns":[{"span":"6","height":"12","properties":{},"rows":[],"layoutComponents":[{"dragTypeName":"org.kie.workbench.common.forms.editor.client.editor.rendering.EditorFieldLayoutComponent","properties":{"field_id":"field_0902830737682317E12","form_id":"7d015478-86c6-4204-820b-5c339cb9af29"},"parts":[{"partId":"TextBox","cssProperties":{}},{"partId":"Field Label","cssProperties":{}}]}]},{"span":"6","height":"12","properties":{},"rows":[],"layoutComponents":[{"dragTypeName":"org.kie.workbench.common.forms.editor.client.editor.rendering.EditorFieldLayoutComponent","properties":{"field_id":"field_2127624435802783E11","form_id":"7d015478-86c6-4204-820b-5c339cb9af29"},"parts":[{"partId":"DecimalBox","cssProperties":{}},{"partId":"Field Label","cssProperties":{}}]}]}]}]}}
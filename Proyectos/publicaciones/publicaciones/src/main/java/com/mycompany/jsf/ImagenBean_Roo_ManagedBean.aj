// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mycompany.jsf;

import com.mycompany.domain.Imagen;
import com.mycompany.domain.Publicacion;
import com.mycompany.jsf.ImagenBean;
import com.mycompany.jsf.converter.PublicacionConverter;
import com.mycompany.service.PublicacionService;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import javax.faces.validator.LengthValidator;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.inputtextarea.InputTextarea;
import org.primefaces.component.message.Message;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect ImagenBean_Roo_ManagedBean {
    
    declare @type: ImagenBean: @ManagedBean(name = "imagenBean");
    
    declare @type: ImagenBean: @SessionScoped;
    
    @Autowired
    PublicacionService ImagenBean.publicacionService;
    
    private String ImagenBean.name = "Imagens";
    
    private Imagen ImagenBean.imagen;
    
    private List<Imagen> ImagenBean.allImagens;
    
    private boolean ImagenBean.dataVisible = false;
    
    private List<String> ImagenBean.columns;
    
    private HtmlPanelGrid ImagenBean.createPanelGrid;
    
    private HtmlPanelGrid ImagenBean.editPanelGrid;
    
    private HtmlPanelGrid ImagenBean.viewPanelGrid;
    
    private boolean ImagenBean.createDialogVisible = false;
    
    @PostConstruct
    public void ImagenBean.init() {
        columns = new ArrayList<String>();
        columns.add("nombre");
    }
    
    public String ImagenBean.getName() {
        return name;
    }
    
    public List<String> ImagenBean.getColumns() {
        return columns;
    }
    
    public List<Imagen> ImagenBean.getAllImagens() {
        return allImagens;
    }
    
    public void ImagenBean.setAllImagens(List<Imagen> allImagens) {
        this.allImagens = allImagens;
    }
    
    public String ImagenBean.findAllImagens() {
        allImagens = Imagen.findAllImagens();
        dataVisible = !allImagens.isEmpty();
        return null;
    }
    
    public boolean ImagenBean.isDataVisible() {
        return dataVisible;
    }
    
    public void ImagenBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid ImagenBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void ImagenBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid ImagenBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void ImagenBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid ImagenBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void ImagenBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid ImagenBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText publicacionCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        publicacionCreateOutput.setId("publicacionCreateOutput");
        publicacionCreateOutput.setValue("Publicacion:   ");
        htmlPanelGrid.getChildren().add(publicacionCreateOutput);
        
        AutoComplete publicacionCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        publicacionCreateInput.setId("publicacionCreateInput");
        publicacionCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{imagenBean.imagen.publicacion}", Publicacion.class));
        publicacionCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{imagenBean.completePublicacion}", List.class, new Class[] { String.class }));
        publicacionCreateInput.setDropdown(true);
        publicacionCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "publicacion", String.class));
        publicacionCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{publicacion.titulo} #{publicacion.descripcion} #{publicacion.tipo} #{publicacion.cantidad}", String.class));
        publicacionCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{publicacion}", Publicacion.class));
        publicacionCreateInput.setConverter(new PublicacionConverter());
        publicacionCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(publicacionCreateInput);
        
        Message publicacionCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        publicacionCreateInputMessage.setId("publicacionCreateInputMessage");
        publicacionCreateInputMessage.setFor("publicacionCreateInput");
        publicacionCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(publicacionCreateInputMessage);
        
        HtmlOutputText nombreCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nombreCreateOutput.setId("nombreCreateOutput");
        nombreCreateOutput.setValue("Nombre: * ");
        htmlPanelGrid.getChildren().add(nombreCreateOutput);
        
        InputTextarea nombreCreateInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        nombreCreateInput.setId("nombreCreateInput");
        nombreCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{imagenBean.imagen.nombre}", String.class));
        LengthValidator nombreCreateInputValidator = new LengthValidator();
        nombreCreateInputValidator.setMaximum(50);
        nombreCreateInput.addValidator(nombreCreateInputValidator);
        nombreCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(nombreCreateInput);
        
        Message nombreCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nombreCreateInputMessage.setId("nombreCreateInputMessage");
        nombreCreateInputMessage.setFor("nombreCreateInput");
        nombreCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nombreCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid ImagenBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText publicacionEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        publicacionEditOutput.setId("publicacionEditOutput");
        publicacionEditOutput.setValue("Publicacion:   ");
        htmlPanelGrid.getChildren().add(publicacionEditOutput);
        
        AutoComplete publicacionEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        publicacionEditInput.setId("publicacionEditInput");
        publicacionEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{imagenBean.imagen.publicacion}", Publicacion.class));
        publicacionEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{imagenBean.completePublicacion}", List.class, new Class[] { String.class }));
        publicacionEditInput.setDropdown(true);
        publicacionEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "publicacion", String.class));
        publicacionEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{publicacion.titulo} #{publicacion.descripcion} #{publicacion.tipo} #{publicacion.cantidad}", String.class));
        publicacionEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{publicacion}", Publicacion.class));
        publicacionEditInput.setConverter(new PublicacionConverter());
        publicacionEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(publicacionEditInput);
        
        Message publicacionEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        publicacionEditInputMessage.setId("publicacionEditInputMessage");
        publicacionEditInputMessage.setFor("publicacionEditInput");
        publicacionEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(publicacionEditInputMessage);
        
        HtmlOutputText nombreEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nombreEditOutput.setId("nombreEditOutput");
        nombreEditOutput.setValue("Nombre: * ");
        htmlPanelGrid.getChildren().add(nombreEditOutput);
        
        InputTextarea nombreEditInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        nombreEditInput.setId("nombreEditInput");
        nombreEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{imagenBean.imagen.nombre}", String.class));
        LengthValidator nombreEditInputValidator = new LengthValidator();
        nombreEditInputValidator.setMaximum(50);
        nombreEditInput.addValidator(nombreEditInputValidator);
        nombreEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(nombreEditInput);
        
        Message nombreEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nombreEditInputMessage.setId("nombreEditInputMessage");
        nombreEditInputMessage.setFor("nombreEditInput");
        nombreEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nombreEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid ImagenBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText publicacionLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        publicacionLabel.setId("publicacionLabel");
        publicacionLabel.setValue("Publicacion:   ");
        htmlPanelGrid.getChildren().add(publicacionLabel);
        
        HtmlOutputText publicacionValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        publicacionValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{imagenBean.imagen.publicacion}", Publicacion.class));
        publicacionValue.setConverter(new PublicacionConverter());
        htmlPanelGrid.getChildren().add(publicacionValue);
        
        HtmlOutputText nombreLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nombreLabel.setId("nombreLabel");
        nombreLabel.setValue("Nombre:   ");
        htmlPanelGrid.getChildren().add(nombreLabel);
        
        InputTextarea nombreValue = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        nombreValue.setId("nombreValue");
        nombreValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{imagenBean.imagen.nombre}", String.class));
        nombreValue.setReadonly(true);
        nombreValue.setDisabled(true);
        htmlPanelGrid.getChildren().add(nombreValue);
        
        return htmlPanelGrid;
    }
    
    public Imagen ImagenBean.getImagen() {
        if (imagen == null) {
            imagen = new Imagen();
        }
        return imagen;
    }
    
    public void ImagenBean.setImagen(Imagen imagen) {
        this.imagen = imagen;
    }
    
    public List<Publicacion> ImagenBean.completePublicacion(String query) {
        List<Publicacion> suggestions = new ArrayList<Publicacion>();
        for (Publicacion publicacion : publicacionService.findAllPublicacions()) {
            String publicacionStr = String.valueOf(publicacion.getTitulo() +  " "  + publicacion.getDescripcion() +  " "  + publicacion.getTipo() +  " "  + publicacion.getCantidad());
            if (publicacionStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(publicacion);
            }
        }
        return suggestions;
    }
    
    public String ImagenBean.onEdit() {
        return null;
    }
    
    public boolean ImagenBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void ImagenBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String ImagenBean.displayList() {
        createDialogVisible = false;
        findAllImagens();
        return "imagen";
    }
    
    public String ImagenBean.displayCreateDialog() {
        imagen = new Imagen();
        createDialogVisible = true;
        return "imagen";
    }
    
    public String ImagenBean.persist() {
        String message = "";
        if (imagen.getCodigo() != null) {
            imagen.merge();
            message = "Successfully updated";
        } else {
            imagen.persist();
            message = "Successfully created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialog.hide()");
        context.execute("editDialog.hide()");
        
        FacesMessage facesMessage = new FacesMessage(message);
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllImagens();
    }
    
    public String ImagenBean.delete() {
        imagen.remove();
        FacesMessage facesMessage = new FacesMessage("Successfully deleted");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllImagens();
    }
    
    public void ImagenBean.reset() {
        imagen = null;
        createDialogVisible = false;
    }
    
    public void ImagenBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}

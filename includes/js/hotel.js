class Amenidades {
    constructor() {
      this.amenidades = [];
    }
  
    addAmenidades(amenidad) {
      this.amenidades.push(amenidad);
    }
  
    getAmenidades() {
      return this.amenidades;
    }
    getCookie(name) {
        return (document.cookie.match('(?:^|;)\\s*'+name.trim()+'\\s*=\\s*([^;]*?)\\s*(?:;|$)')||[])[1];
    }
    showAmenidades() {
      var templete = '';
      this.getAmenidades().forEach(function (data, index) {
        templete += `
        <div class="col-md-12 mrg20T">                                                            
            <div class="input-group">
                <span class="input-group-addon"><i class="glyph-icon icon-building"></i></span>                          
                <input type="text" class="form-control" value=${data.hab_id}>
            </div>
        </div>  
        `;
      });
      return templete;
    }
  }
  
  const btnAdd = document.getElementById('addTask');
  const amenidad = document.getElementById('txtamenidad');
  const content = document.getElementById('content');
  const save = document.getElementById('btnsaveAmenidad');
  var options = document.getElementsByTagName('option');
  var data = new Amenidades();
 var idHotel = parseInt(data.getCookie('idHotel'));

  btnAdd.addEventListener('click', () => {
      
    if (amenidad.value == 0) return false;
    let ameni = options[amenidad.value].innerHTML;
      var a = { hotel_id: (idHotel) + 1, hab_id: ameni };
    data.addAmenidades(a);
    data.getAmenidades().forEach(function (data, index) {
      for (var i = 0; i < amenidad.length; i++) {
        if (amenidad.options[i].value == data.hab_id) amenidad.remove(i);
      }
    });
  
    content.innerHTML = data.showAmenidades();
  });
  
  save.addEventListener('click', () => {
    console.log(data.getAmenidades());

  });
  

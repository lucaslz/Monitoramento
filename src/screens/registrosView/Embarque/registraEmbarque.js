import React, { Component } from 'react';
import { View, Text, FlatList, ScrollView, RefreshControl } from 'react-native';
import ModalPonto from './modalPonto';
import stylesContainer from '../../../styles/Modal';

import _ from "lodash";

import Header from '../../../components/navigationMenu'

class RegistraEmbarque extends Component {
  constructor(props) {
    super(props);
    this.state = {

      refreshServer: false,
      refreshFlat : false,

      pontosJson: [
          {
            value: 'default',
            id: 0 ,
            alunos: [
              {
                id: 0,
                nome: 'Null',
                idade: 'Null',
                escola: 'NUll',
                turno: 'NUll',
                presenca: 0,
              }
            ]
          },
      ]
    };
  }

  //Refresh
  onRefreshServer(){
    this.setState({refreshServer: true})
    this.onRefreshFlat()
    this.wait(2000).then(() => this.pontoServe())
    
  }

  onRefreshFlat(){
    this.setState({refreshFlat : !this.state.refreshFlat})
  }

  wait(timeout) {
    return new Promise(resolve => {
      setTimeout(resolve, timeout);
    });
  }

  //Servidor
  async pontoServe(){
    let link = URL_API + '/pontos.json' 
    try {
      const data = await fetch(link);
      const dataJson = await data.json();
      this.setState({ pontosJson: dataJson.pontos });
      
      console.log("Aluno okay");
      
      this.shareBustop(dataJson.pontos)
      this.setState({refreshServer: false})

    }
    catch (error) {
      alert("Ops !! alguma coisa errada no alunoServe")
      this.setState({refreshServer: false})
      return console.log(error);
    } //to catch the errors if any
  }

  async finalizarEmbarque(ponto,AlunosPonto) {    
    let pontosJson = this.state.pontosJson
    pontosJson[ponto].alunos = _.cloneDeep(AlunosPonto)
    this.setState({pontosJson})

    await this.enviarServer(ponto)
    await this.enviarServer(ponto)
    
    this.onRefreshFlat()

    this.props.navigation.navigate('Iniciar', {index: ponto})
  }

  async enviarServer(ponto){
    let link = URL_API + '/pontos.json' 

        const dados = { 
          alunos : this.state.pontosJson[ponto].alunos
        };

        try{
          const response = await fetch(link, {
            method: 'POST', // or 'PUT'
            headers:{
              'Content-Type': 'application/json',
            },
            body: JSON.stringify(dados),
          });
          let responseJson = await response.json();
          
          if (response.ok){
            alert("alunos embarcados com sucesso")
          }
        }
        catch (error) {
          alert("Ops !! alguma coisa errada no submeter_Rota")
          console.log(error);
          return false
        }
  }
  
  //Share Functions
  shareBustop(dataArray){
    let data = dataArray.map((point, index) => {
      return {
          latitude: point.lat,
          longitude: point.lon,
          value: point.value,
          arrive: false
      }
  })
    this.props.navigation.navigate('Iniciar', {busStops: data}) 
  }


  //special functions for students
  delStudent(index,ponto){
    
    let pontosJson = _.cloneDeep(this.state.pontosJson)
    let alunos = pontosJson[ponto].alunos
    let aluno = undefined
        
    aluno = alunos.splice(index,1)

    if (aluno == undefined){
      return aluno

    }else {
      pontosJson[ponto].alunos = alunos
      this.setState({pontosJson})
      this.onRefreshFlat()
      return (aluno[0])
    }
  }

  searchStudent(id, ponto){
    let pontosJson = _.cloneDeep(this.state.pontosJson)
    let alunos = pontosJson[ponto].alunos
    let index = alunos.findIndex(
      (element,index,array) => {
        return (element.id == id)
      }
    )

    if (index != -1){
      let aluno = alunos[index]
      let dados = {
        aluno : aluno,
        index : index
      }
      
      return dados
    }else{

      return undefined

    }
  }


  render() {
    return (
      <View style={stylesContainer.background}>
        <Header title = "Registrar embarque" navigationProps={this.props.navigation.toggleDrawer}/>
        <ScrollView contentContainerStyle={stylesContainer.conteiner}
          refreshControl={<RefreshControl refreshing={this.state.refreshServer} onRefresh={() => this.onRefreshServer()}/>}>
          <FlatList
            
            keyExtractor={item => String(item.id)}
            data={this.state.pontosJson}
            extraData = {this.state.refreshFlat}
            renderItem={
              ({ item, index }) => {
                return (
                  
                  <ModalPonto
                    data={item.alunos}
                    ponto={index}
                    titulo = {item.value}
                    finalizarEmbarque={(ponto,AlunosPonto) => this.finalizarEmbarque(ponto,AlunosPonto)}
                    delStudent = {(index,ponto) => this.delStudent(index,ponto)}
                    searchStudent = {(id, ponto) => this.searchStudent(id, ponto)}
                    refresh = {() => this.onRefreshFlat()}
                  />)
              }
            } />
            
        </ScrollView>
      </View>
    );
  }
}

export default RegistraEmbarque;

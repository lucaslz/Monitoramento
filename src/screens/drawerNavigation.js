import React, { Component } from 'react';
import { View, Text, Dimensions, Image, ScrollView } from 'react-native';
import { createAppContainer } from 'react-navigation'
import { createDrawerNavigator, DrawerNavigatorItems } from 'react-navigation-drawer'

import { Ionicons } from '@expo/vector-icons';

import Iniciar from './registrosView/iniciar'
import RegistraRota from './registrosView/registraRota';
import RegistraEmbarque from './registrosView/Embarque/registraEmbarque';
import Desembarque from './registrosView/desembarque/desembarque';
import Informacao from './informacoesDraw/InformacaoDrawer'
import Login from './login/login';
import Exit from './exit';
import Start from './start'


const WINDOW_WIDTH = Dimensions.get('window').width;

const CustomDrawerContentComponent = props => (
  <ScrollView style={{ flex: 1, backgroundColor: '#43484d', flexDirection: 'column'}}>
    <View
      style={{ marginTop: 30, justifyContent: 'space-around', alignItems: 'center' , flex: 1}}
    >
      <Image
        source={require('../assets/logo/logo.png')}
        style={{ width: WINDOW_WIDTH * 0.80, height: WINDOW_WIDTH * 0.80 }}
        resizeMode="cover"

      />
    </View>
    <View style={{ marginLeft: 30, flex: 1 }}>
      <DrawerNavigatorItems {...props} />
    </View>
  </ScrollView>
);

const MyDrawerNavigation =
  createDrawerNavigator(
    {
      Login: {
        screen: Login,
        navigationOptions: ({navigation}) => ({
          drawerLabel: 'Login',
          drawerIcon: <Ionicons name="ios-body" size={30} color="white" />,
        })
      },

      Start: {
        screen: Start,
        navigationOptions: ({navigation}) => ({
          drawerLabel: 'Entrada',
          drawerIcon: <Ionicons name="ios-cloud-upload" size={30} color="white" />
          //drawerLabel: () => null
        })
      },
      
      RegistraR: {
        screen: RegistraRota,
        navigationOptions: ({navigation}) => ({
            drawerLabel: 'Registrar rota',
            drawerIcon: <Ionicons name="md-bus" size={30} color="white" />,
          })
      },

      Iniciar: {
        screen: Iniciar,
        navigationOptions: ({navigation}) => ({
          drawerLabel: 'Iniciar rota',
          drawerIcon: <Ionicons name="md-speedometer" size={30} color="white" />,
        })
      },

      RegistraE: {
        screen: RegistraEmbarque,
        navigationOptions: ({navigation}) => ({
            drawerLabel: 'Embarcar',
            drawerIcon: <Ionicons name="md-person-add" size={30} color="white" />,
          })
      },
      
      Desembarque: {
        screen: Desembarque,
        navigationOptions: ({navigation}) => ({
            drawerLabel: 'Desembarcar',
            drawerIcon: <Ionicons name="md-pin" size={30} color="white" />,
          })
      },
      
      Sair: {
        screen: Exit,
        navigationOptions: ({navigation}) => ({
          drawerLabel: 'Sair',
          drawerIcon: <Ionicons name="md-bed" size={30} color="white" />,
        })
      },

      
      
      /*
      Informacao: {
        screen: Informacao,
        navigationOptions: ({navigation}) => ({
            drawerLabel: 'Informações',
            drawerIcon: <Ionicons name="md-finger-print" size={30} color="white" />,
          })
      },
      */
    },
    {
      initialRouteName: 'Login',
      contentOptions: {
        activeTintColor: '#548ff7',
        activeBackgroundColor: 'transparent',
        inactiveTintColor: '#ffffff',
        inactiveBackgroundColor: 'transparent',
        labelStyle: {
          fontSize: 15,
          marginLeft: 0,
        },
      },
      drawerWidth: Math.min(WINDOW_WIDTH * 0.8, 300),
      contentComponent: CustomDrawerContentComponent,
    }
  )


export default createAppContainer(MyDrawerNavigation); 